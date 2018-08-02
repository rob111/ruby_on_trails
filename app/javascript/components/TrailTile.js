import React, { Component } from 'react'
import { Link } from 'react-router'

class TrailTile extends Component {

  render() {
    return (
      <Link to={`/trails/${this.props.id}`}>
        <div className="panel">
            {this.props.name}
        </div>
      </Link>
    )
  }
}

export default TrailTile;
