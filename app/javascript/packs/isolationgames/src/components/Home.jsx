import React, { Component } from 'react';
import NewGameButton from './NewGameButton'

class Home extends Component {
  render() {
    return (
      <div>
        <header>
          <h1>Isolation Games</h1>
        </header>
        <NewGameButton />
      </div>
    );
  }
}

export default Home;
