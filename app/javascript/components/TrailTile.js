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

        <ul>
          <li>
            <Link to={`/trails/${this.props.id}`}>
              {this.props.name}
            </Link>
        </li>
      </ul>
      </div>
    )
  }

}

export default TrailTile;
