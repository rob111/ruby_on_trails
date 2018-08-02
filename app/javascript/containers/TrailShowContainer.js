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
      active_user_id: null,
      reviews: [],
      usernames: [],
      ascent: '',
      low_elevation: '',
      high_elevation: '',
      photo: '',
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
        ascent: body.trail.ascent,
        low_elevation: body.trail.low_elevation,
        high_elevation: body.trail.high_elevation,
        active_user_id: body.current_user.id,
        admin: body.current_user.admin,
        reviews: body.reviews,
        photo: body.trail.photo,
        usernames: body.usernames
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let trailPhoto;
    if (this.state.photo != '' && this.state.photo != null ) {
      trailPhoto = <img src={this.state.photo}/>
    }
    let streetShow;
    if (this.state.street != '' && this.state.street != null) {
      streetShow = <div id='street'>Street: {this.state.street}</div>
    }
    let zipShow;
    if (this.state.zip != '' && this.state.zip != null) {
      zipShow = <div id='zip'>Zipcode: {this.state.zip}</div>
    }
    let review_title = null
    if (this.state.reviews.length > 0) {
      review_title = "Reviews:"
    }
    let new_review_link = ''
    if (this.state.active_user_id) {
      new_review_link = <a href={`/trails/${this.props.params.id}/reviews/new`}>Review This Trail</a>
    }

    let edit_trail_link = ''
    if (this.state.admin) {
      edit_trail_link = <a href={`/trails/${this.props.params.id}/edit`}>Edit This Trail</a>
    }

    let reviews = this.state.reviews.map((review, index) => {
      let editReviewLink = '';
      if (this.state.active_user_id === review.user_id || this.state.admin) {
        editReviewLink = <a href={`/trails/${this.props.params.id}/reviews/${review.id}/edit`}>Edit Review</a>
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
          {trailPhoto}
          {streetShow}
          <div id='city'>City: {this.state.city}<br/></div>
          <div id='state'>State: {this.state.state}<br/></div>
          {zipShow}
          <div id='start_lat'>Starting latitude: {this.state.start_latitude}<br/></div>
          <div id='start_lon'>Starting longitude: {this.state.start_longitude}<br/></div>
          <div id='length'>Trail length: {this.state.length} miles<br/></div>
          <div id='low_elevation'>Low elevation: {this.state.low_elevation}ft<br/></div>
          <div id='high_elevation'>High elevation: {this.state.high_elevation}ft<br/></div>
          <div id='ascent'>Total ascent: {this.state.ascent}ft<br/></div>
          <div id='difficulty'>Difficulty rating: {this.state.difficulty}<br/></div>
        </div>
        <br/>
        <div>{new_review_link}</div>
        <div>{edit_trail_link}</div>
        <div>
          <h2>{review_title}</h2>
          {reviews}
        </div>
      </div>
    )
  }
}

export default TrailShow;
