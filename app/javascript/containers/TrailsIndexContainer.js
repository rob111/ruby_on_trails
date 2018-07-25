import React, { Component } from 'react'
import TrailTile from '../components/TrailTile'

class TrailsIndexContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      trails: []
    }
  }

  componentDidMount() {
    fetch('/api/v1/trails')
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
        trails: body
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }


  render() {
    let trails = this.state.trails.map((trail) => {
      return (
        <TrailTile
          key={trail.id}
          id={trail.id}
          name={trail.name}
          street={trail.street}
          city={trail.city}
          state={trail.state}
          zip={trail.zip}
          start_latitutde={trail.start_latitutde}
          start_longitude={trail.start_longitude}
          length={trail.length}
          difficulty={trail.difficulty}
          elevation={trail.elevation}
        />
      )
    })
    return (
      <div>
        <h2>Trails</h2>
        {trails}
      </div>
    )
  }
}

export default TrailsIndexContainer;
