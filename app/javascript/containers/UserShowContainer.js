import React, { Component } from 'react'

class UserShow extends Component {
  constructor(props) {
    super(props)
    this.state = {
      userName: '',
      email: '',
      profilePhoto: {},
      reviewCount: 0
    }
  }

  componentDidMount() {
    fetch(`/api/v1/users/${this.props.params.id}`)
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
      this.setState({
        userName: body.user.username,
        email: body.user.email,
        profilePhoto: body.user.profile_photo,
        reviewCount: body.review_count
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div>
        <h2>{this.state.userName}</h2>
        <div className="panel-non-link">
          <img src={this.state.profilePhoto.url} />
          <div id='email'>Email: {this.state.email}</div>
          <div id='user-review-count'>Reviews Submitted: {this.state.reviewCount}</div>
        </div>
        <a className="btn-and-link white-link" href='/users/edit'>Edit Profile</a>
      </div>
    )
  }
}

export default UserShow;
