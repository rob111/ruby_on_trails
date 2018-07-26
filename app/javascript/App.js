import React, { Component } from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'
import TrailsIndexContainer from './containers/TrailsIndexContainer'
import TrailTile from './components/TrailTile'
import TrailShowContainer from './containers/TrailShowContainer'
import UserShowContainer from './containers/UserShowContainer'

class App extends Component {

  render() {
    return (
      <Router history={browserHistory}>
        <Route path='/'>
          <IndexRoute component={TrailsIndexContainer} />
          <Route path='/trails' component={TrailsIndexContainer} />
          <Route path='/trails/:id' component={TrailShowContainer} />
          <Route path ='/users/:id' component={UserShowContainer} />
        </Route>
      </Router>
    )
  }
}

export default App;
