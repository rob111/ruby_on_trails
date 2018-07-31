import React, { Component } from 'react'

class UserShow extends Component {
  constructor(props) {
    super(props)
    this.state = {
      userName: '',
      email: '',
      profile_photo: {}
    }
  }

  componentDidMount() {
    fetch(`/api/v1/users/${this.props.params.id}`)
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
        userName: body.username,
        email: body.email,
        profile_photo: body.profile_photo
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div>
        <img src={this.state.profile_photo.url} />
        <h2>{this.state.userName}</h2>
        <div id='email'>Email: {this.state.email}</div>
        <a href='/users/edit'>Edit Your Profile</a>
      </div>
    )
  }
}

export default UserShow;