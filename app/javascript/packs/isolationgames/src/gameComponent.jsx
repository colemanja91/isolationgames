import React, { Component } from 'react';
import { Mutation } from "react-apollo";
import { NEW_GAME } from "../apollo"

class Game extends Component {
  constructor(props) {
    super(props)
    this.state = {}
  }

  handleFormSubmit = ( props ) => {
    let { newGame } = props;
    newGame()
    .then((response) =>{
      alert('New game created! Invite friends to get started')
      const { data } = response;
      console.log(data)
    })
    .catch((e) => {
      let messages = JSON.parse(e.graphQLErrors[0].message)
      this.setState({
        errors : messages.errors
      })

    })
  }

  showErrors = () =>{
    let { errors } = this.state;
    const errorsList = errors.map((error, index)=>(
      <li key={index}>{error}</li>
    ))

    return (
      <ul>
        {errorsList}
      </ul>
    )
  }

  render() {
    return (
      <Mutation mutation={NEW_GAME} >
        {(newGame) =>(
          <div>
            <h2>New Game</h2>
            <form onSubmit={ e =>{
              e.preventDefault()
              this.handleFormSubmit({ newGame })
            }}>
              <button type="submit">Start a new game!</button>
            </form>
          </div>
        )}
      </Mutation>
    );
  }
}

export default Game;
