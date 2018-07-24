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
        <br/>
        <div>
          <a href={`/trails/${this.props.params.id}/reviews/new`}>Review This Trail</a>
        </div>
      </div>
    )
  }
}

export default TrailShow;
