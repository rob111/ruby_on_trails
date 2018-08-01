import React, { Component } from 'react'
import ReviewTile from '../components/ReviewTile'


class TrailShow extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: '',
      street: '',
      city: '',
      state: '',
      zip: '',
      start_latitude: '',
      start_longitude: '',
      length: '',
      difficulty: '',
      elevation: '',
      active_user_id: null,
      reviews: [],
      admin: null
    }
  }

  componentDidMount() {
    fetch(`/api/v1/trails/${this.props.params.id}`, {
      credentials: 'same-origin',
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
      this.setState({
        name: body.trail.name,
        street: body.trail.street,
        city: body.trail.city,
        state: body.trail.state,
        zip: body.trail.zip,
        start_latitude: body.trail.start_latitude,
        start_longitude: body.trail.start_longitude,
        length: body.trail.length,
        difficulty: body.trail.difficulty,
        elevation: body.trail.elevation,
        active_user_id: body.current_user.id,
        admin: body.current_user.admin,
        reviews: body.reviews
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let review_title = null
    if (this.state.reviews.length > 0) {
      review_title = <h2>Reviews</h2>
    }
    let new_review_link = ''
    if (this.state.active_user_id) {
      new_review_link = <div><a href={`/trails/${this.props.params.id}/reviews/new`}><div className="btn-and-link white-link">Review This Trail</div></a></div>
    }

    let edit_trail_link = ''
    if (this.state.admin) {
      edit_trail_link = <div><a className='btn-and-link white-link' href={`/trails/${this.props.params.id}/edit`}>Edit This Trail</a></div>
    }

    let reviews = this.state.reviews.map((review, index) => {
      let editReviewLink = '';
      if (this.state.active_user_id === review.user_id || this.state.admin) {
        editReviewLink = <div><a className='btn-and-link white-link' href={`/trails/${this.props.params.id}/reviews/${review.id}/edit`}>Edit Review</a></div>
      }

      return (
        <div>
          <ReviewTile
            key={review.id}
            id={review.id}
            username={review.user}
            likes={review.likes}
            rating={review.rating}
            commentbody={review.comment}
            editReviewLink={editReviewLink}
            currentUser={this.state.active_user_id}
            voteCount={review.votes}

          />
        </div>
      )
    }, this)
    return (
      <div>
        <div>
          <h2>{this.state.name}</h2>
          <div className='panel-non-link'>
            <div id='street'><span className='bold'>Street:</span> {this.state.street}</div>
            <div id='city'><span className='bold'>City:</span> {this.state.city}</div>
            <div id='state'><span className='bold'>State:</span> {this.state.state}</div>
            <div id='zip'><span className='bold'>Zip code:</span> {this.state.zip}</div>
            <div id='start_lat'><span className='bold'>Starting latitude:</span> {this.state.start_latitutde}</div>
            <div id='start_lon'><span className='bold'>Starting longitude:</span> {this.state.start_longitude}</div>
            <div id='length'><span className='bold'>Trail length:</span> {this.state.length}</div>
            <div id='elevation'><span className='bold'>Elevation:</span> {this.state.elevation}</div>
            <div id='difficulty'><span className='bold'>Difficulty rating:</span> {this.state.difficulty}</div>
          </div>
        </div>
        {new_review_link}
        {edit_trail_link}
        <div>
          {review_title}
          {reviews}
        </div>

      </div>
    )
  }
}

export default TrailShow;
