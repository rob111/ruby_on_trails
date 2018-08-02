import React, { Component } from 'react';

class VoteButton extends Component {
  constructor(props) {
    super(props);
    this.state = {
      liked: null,
      like_id: null,
      count: props.voteCount
    }
    this.recordLikes = this.recordLikes.bind(this)
    this.selectedVote = this.selectedVote.bind(this)
  }

  componentDidMount(){
    if (this.props.likes.length > 0) {
      this.props.likes.forEach(voteRecord => {
        if (voteRecord.user_id == this.props.currentUser) {
          this.setState({liked: voteRecord.vote, like_id: voteRecord.id})
        }
      })

    }
  }

  recordLikes(event) {
    let formPayload = {
      like_id: this.state.like_id,
      liked: this.state.liked,
      reviewId: this.props.reviewId,
      currentUser: this.props.currentUser,
      button: event.target.text
    }
    fetch('/api/v1/likes', {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(formPayload),
      headers: { 'Content-Type': 'application/json'}
    })
    .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
    .then(response => response.json())
    .then(body => {
      this.setState({liked: body.like.vote, count: body.votes, like_id: body.like.id})
    })
     .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  selectedVote(id){
    if ((this.state.liked == 'like' && id == 'upvoteContainer') || (this.state.liked == 'dislike' && id == 'downvoteContainer')) {
      return 'selected';
    }
  }

  render(){
    let countMessage;
    if (this.state.count == 1) {
      countMessage = "user liked this review"
    } else {
      countMessage = "users liked this review"
    }
    let showVoterButtons;
    if(this.props.currentUser){
      showVoterButtons =
      <span>
        <div className={`vote-button ${this.selectedVote("upvoteContainer")}`} id="upvoteContainer">
          <a onClick={this.recordLikes}>
            Like</a>
        </div>
        <div className={`vote-button ${this.selectedVote("downvoteContainer")}`} id="downvoteContainer">
          <a onClick={this.recordLikes}>
            Dislike</a>
        </div>
      </span>
    }
    return (
      <div>
        <div id="voteCount">
          {this.state.count} {countMessage}
        </div>
          {showVoterButtons}
    </div>
    );
  }
}

export default VoteButton;
