import React, { Component } from 'react'
import { Link } from 'react-router'

class TrailTile extends Component {
  constructor(props) {
    super(props)
    this.state = {

    }
  }

  render() {
    return (
      <div>
        <Link to={`/trails/${this.props.id}`}>
          {this.props.name}
        </Link>
      </div>
    )
  }

}

export default TrailTile;
