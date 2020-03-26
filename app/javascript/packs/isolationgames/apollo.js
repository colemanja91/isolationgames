import ApolloClient from "apollo-boost";
import gql from "graphql-tag";

export  const client = new ApolloClient({
  uri: "/graphql",
})


export const NEW_GAME = gql `
  mutation NewGame {
    newGame{
      id
      isOwner
      name
      players {
        id
        isOwner
        status
        userDisplayName
      }
      startedAt
      status
      videoLink
    }
  }
`
