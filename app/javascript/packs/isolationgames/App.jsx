import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { ApolloProvider } from "react-apollo"
import { client } from "./apollo"
import NavBar from './src/components/NavBar'
import './assets/stylesheets/App.scss'

class App extends Component {
  render() { 
    return ( 
      <ApolloProvider client={client}>
        <NavBar />
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
