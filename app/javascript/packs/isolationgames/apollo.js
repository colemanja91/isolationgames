import ApolloClient from "apollo-boost";
import gql from "graphql-tag";

export const client = new ApolloClient({
  uri: "/graphql",
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

export const START_GAME = gql`
  mutation StartGame {
    startGame {
      id
    }
  }
`;

export const ADD_VIDEO_LINK = gql`
  mutation AddVideoLink($videoLink: String!) {
    addVideoLink(videoLink: $videoLink) {
      id
      videoLink
    }
  }
`;

export const PICK_WINNER = gql`
  mutation PickWinner($userRoundId: Int!) {
    pickWinner(userRoundId: $userRoundId) {
      id
    }
  }
`;

export const PLAY_CARDS = gql`
  mutation PlayCards($userCardIds: [Int!]!) {
    playCards(userCardIds: $userCardIds) {
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
      enoughPlayers
      isOwner
      currentRound {
        blackCard {
          text
          pick
        }
        hasPlayed
        isJudge
        round
        status
        userRounds {
          id
          user {
            displayName
          }
          userCards {
            text
          }
          winner
        }
        winner {
          id
        }
      }
      hand {
        id
        text
      }
      name
      players {
        id
        hasPlayed
        isJudge
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
