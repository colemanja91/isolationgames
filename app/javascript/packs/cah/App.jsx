import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { ApolloProvider } from "react-apollo"
import { client } from "./apollo"
import Game from './src/gameComponent';

class App extends Component {
  render() { 
    return ( 
      <ApolloProvider client={client}>
        <div>
          <header>
            <h1>Cards Against Humanity</h1>
          </header>
          <Game />
        </div>
      </ApolloProvider>
     );
  }
}


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
