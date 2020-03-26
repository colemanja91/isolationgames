import React, { Component } from 'react';
import { Mutation } from "react-apollo";
import { NEW_GAME } from "../../apollo";
import '../../assets/stylesheets/components/Button.scss'

class NewGameButton extends Component {
  constructor(props) {
    super(props)
    this.state = {
      errors: []
    }
  }

  handleFormSubmit = ( props ) => {
    let { newGame } = props;
    newGame()
    .then((response) =>{
      alert('New game created! Invite other horrible people to get started.')
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
          <div className="NewGameButton">
            <this.showErrors/>
            <form onSubmit={ e =>{
              e.preventDefault()
              this.handleFormSubmit({ newGame })
            }}>
              <button type="submit">Start a new game.</button>
            </form>
          </div>
        )}
      </Mutation>
    );
  }
}

export default NewGameButton;
