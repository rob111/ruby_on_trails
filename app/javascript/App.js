import React, { Component } from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import TrailsIndexContainer from './containers/TrailsIndexContainer';
import TrailTile from './components/TrailTile';


class App extends Component {

  render() {
    return (
      <Router history={browserHistory}>
        <Route path='/'>
          <IndexRoute component={TrailsIndexContainer} />
          <Route path='/trails' component={TrailsIndexContainer} />
        </Route>
      </Router>
    )
  }
}

export default App;
