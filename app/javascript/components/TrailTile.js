import React, { Component } from 'react'
import { Link } from 'react-router'

class TrailTile extends Component {

  render() {
    return (
      <div className="large-4 medium-6 small-12 columns trail-tile">
        <Link to={`/trails/${this.props.id}`}>
          <img className="images" src={this.props.photo}/>
          <div className="image-name">
            {this.props.name}
          </div>
        </Link>
      </div>
    )
  }
}

export default TrailTile;
