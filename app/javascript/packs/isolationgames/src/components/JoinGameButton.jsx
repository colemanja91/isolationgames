import React, { Component } from 'react';
import { Mutation } from "react-apollo";
import { JOIN_GAME } from "../../apollo";
import '../../assets/stylesheets/components/Button.scss'

class JoinGameButton extends Component {
  constructor(props) {
    super(props)
    this.state = {
      gameName: null,
      errors: []
    }
  }

  handleFormSubmit = ( props ) => {
    let { joinGame } = props;
    let { gameName } = this.state;

    joinGame({
      variables: {
        gameName: gameName
      }
    })
    .then((response) =>{
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

  handleChange = (event) =>{
    this.setState({
      [event.target.id]: event.target.value
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
      <Mutation mutation={JOIN_GAME} >
        {(joinGame) =>(
          <div className="JoinGameButton">
            <this.showErrors/>
            <form onSubmit={ e =>{
              e.preventDefault()
              this.handleFormSubmit({ joinGame })
            }}>
              <button type="submit">Join an existing game.</button>
              <div>
                <label>Game Name</label>
                <input type="text" id="gameName" onChange={this.handleChange} required/>
              </div>
            </form>
          </div>
        )}
      </Mutation>
    );
  }
}

export default JoinGameButton;
