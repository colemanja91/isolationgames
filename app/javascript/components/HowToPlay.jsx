import React from "react";

function HowToPlay() {
  return (
    <div>
      <ul>
        <li>
          Based on the{" "}
          <a href="http://s3.amazonaws.com/cah/CAH_Rules.pdf">
            Cards Against Humanity classic rules.
          </a>
        </li>
        <li>
          <b>Starting a game:</b>
          <ul>
            <li>You must have at least 4 players.</li>
            <li>
              (Ideally, you should have no more than 10 players, but that isn't
              enforced)
            </li>
            <li>
              To invite players, send them the "Game name" from the left-hand
              side of the screen (i.e., "obtuse-octopus-12345"
            </li>
            <li>
              Once you have at least 4 players - including yourself - you can
              click the "Start Game" button on the left.
            </li>
          </ul>
        </li>
        <li>
          <b>Pro tip:</b> Add a video link on the right (i.e., Zoom, Google
          Hangouts). This game is a lot more fun when you can see each other's
          ugly faces.
        </li>
        <li>
          <b>Playing a round:</b>
          <ul>
            <li>Each player is automatically dealt 10 white cards.</li>
            <li>
              Each round, a judge is chosen and indicated on the screen (if
              you're the judge, the screen will practically be screaming at you,
              so you'd have to be pretty stupid to miss it).
            </li>
            <li>When the round starts, a black card is shown on screen.</li>
            <li>
              The judge reads the black card out loud (see the pro tip above
              about having a video chat).
            </li>
            <li>
              Each player selects their one (or two) white cards to play, then
              hits "Submit".
            </li>
            <li>
              Once everyone has submitted their white cards, they will show up
              (anonymously).
            </li>
            <li>
              The judge reads the white cards out loud (seriously, use a video
              chat).
            </li>
            <li>
              The judge selects the winner, the round ends, the winner
              celebrates, the loosers weep.
            </li>
            <li>
              The judge hits the "New Round" button to start the next round.
              (Helpful in case someone needs a poop break).
            </li>
          </ul>
        </li>
        <li>
          Keep playing until you're all sick of each other, or too drunk to be
          coherent.
        </li>
      </ul>
    </div>
  );
}

export default HowToPlay;
