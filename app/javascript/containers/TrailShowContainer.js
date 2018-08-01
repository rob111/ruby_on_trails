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
      start_latitutde: '',
      start_longitude: '',
      length: '',
      difficulty: '',
      elevation: '',
      active_user_id: null,
      reviews: [],
      usernames: [],
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
        start_latitutde: body.trail.start_latitutde,
        start_longitude: body.trail.start_longitude,
        length: body.trail.length,
        difficulty: body.trail.difficulty,
        elevation: body.trail.elevation,
        active_user_id: body.active_user_id,
        admin: body.admin,
        reviews: body.reviews,
        usernames: body.usernames
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let review_title = null
    if (this.state.reviews.length > 0) {
      review_title = "Reviews"
    }
    let new_review_link = ''
    if (this.state.active_user_id) {
      new_review_link = <div> <a href={`/trails/${this.props.params.id}/reviews/new`}><div className="btn-and-link white-link">Review This Trail</div></a></div>
    }

    let edit_trail_link = ''
    if (this.state.admin) {
      edit_trail_link = <a className='btn-and-link white-link' href={`/trails/${this.props.params.id}/edit`}>Edit This Trail</a>
    }

    let reviews = this.state.reviews.map((review, index) => {
      let editReviewLink = '';
      if (this.state.active_user_id === review.user_id || this.state.admin) {
        editReviewLink = <a className='white-link' href={`/trails/${this.props.params.id}/reviews/${review.id}/edit`}>Edit Review</a>
      }
      return (
        <div>
          <ReviewTile
            key={review.id}
            id={review.id}
            username={this.state.usernames[index]}
            rating={review.rating}
            commentbody={review.comment}
            editReviewLink={editReviewLink}
          />
        </div>
      )
    }, this)

    return (
      <div>
        <div>
          <h2>{this.state.name}</h2>
          <div className='panel-non-link'>
            <div id='street'>Street: {this.state.street}<br/></div>
            <div id='city'>City: {this.state.city}<br/></div>
            <div id='state'>State: {this.state.state}<br/></div>
            <div id='zip'>Zip code: {this.state.zip}<br/></div>
            <div id='start_lat'>Starting latitude: {this.state.start_latitutde}<br/></div>
            <div id='start_lon'>Starting longitude: {this.state.start_longitude}<br/></div>
            <div id='length'>Trail length: {this.state.length}<br/></div>
            <div id='elevation'>Elevation: {this.state.elevation}<br/></div>
            <div id='difficulty'>Difficulty rating: {this.state.difficulty}<br/></div>
          </div>
        </div>
        <br/>
        {new_review_link}<br/><br />
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
