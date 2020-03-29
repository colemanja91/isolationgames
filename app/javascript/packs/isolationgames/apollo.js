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

export const END_GAME = gql`
  mutation EndGame {
    endGame {
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

export const LEAVE_GAME = gql`
  mutation LeaveGame {
    leaveGame {
      id
    }
  }
`;

export const UPDATE_USER_NAME = gql`
  mutation UpdateUserName($name: String!) {
    updateUserName(name: $name) {
      displayName
    }
  }
`;

export const USER = gql`
  query User {
    user {
      id
      displayName
      email
      name
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
