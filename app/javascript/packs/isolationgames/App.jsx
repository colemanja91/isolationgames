import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { ApolloProvider } from "react-apollo"
import { client } from "./apollo"
import NewGameButton from './src/components/NewGameButton'

class App extends Component {
  render() { 
    return ( 
      <ApolloProvider client={client}>
        <div>
          <header>
            <h1>Isolation Games</h1>
          </header>
          <NewGameButton />
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
