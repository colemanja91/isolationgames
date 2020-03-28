import ApolloClient from "apollo-boost";
import gql from "graphql-tag";

export const client = new ApolloClient({
  uri: "/graphql"
});

export const NEW_GAME = gql`
  mutation NewGame {
    newGame {
      id
    }
  }
`;

export const JOIN_GAME = gql`
  mutation JoinGame($gameName: String!) {
    joinGame(gameName: $gameName) {
      id
    }
  }
`;

export const USER = gql`
  query User {
    user {
      id
      displayName
      email
    }
  }
`;

export const GAME = gql`
  query Game {
    game {
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
`;
