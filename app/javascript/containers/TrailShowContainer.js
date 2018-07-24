import React, { Component } from 'react'

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
      elevation: ''
    }
  }

  componentDidMount() {
    fetch(`/api/v1/trails/${this.props.params.id}`)
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
        name: body.name,
        street: body.street,
        city: body.city,
        state: body.state,
        zip: body.zip,
        start_latitutde: body.start_latitutde,
        start_longitude: body.start_longitude,
        length: body.length,
        difficulty: body.difficulty,
        elevation: body.elevation
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div>
        <div>
          <h2>{this.state.name}</h2>
          Street: {this.state.street}<br/>
          City: {this.state.city}<br/>
          State: {this.state.state}<br/>
          Zip: {this.state.zip}<br/>
          Starting latitude: {this.state.start_latitutde}<br/>
          Starting longitude: {this.state.start_longitude}<br/>
          Trail length: {this.state.length}<br/>
          Elevation: {this.state.elevation}<br/>
          Difficulty rating: {this.state.difficulty}<br/>
        </div>
        <br/>
        <div>
          <a href={`/trails/${this.props.params.id}/reviews/new`}>Review This Trail</a>
        </div>
      </div>
    )
  }
}

export default TrailShow;
