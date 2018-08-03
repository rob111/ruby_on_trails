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
    fetch('/api/v1/trails', {
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
          start_latitude={trail.start_latitude}
          start_longitude={trail.start_longitude}
          length={trail.length}
          difficulty={trail.difficulty}
          elevation={trail.elevation}
          photo={trail.photo}
        />
      )
    })

    return (
      <div>
        <h2 className="names-in-rounded-box">Trails</h2>
        <div className="large-12 medium-12 small-12 columns">
          <div className="row">
            {trails}
          </div>
        </div>
      </div>
    )
  }
}

export default TrailsIndexContainer;
