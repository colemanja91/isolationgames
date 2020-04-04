import React from "react";

function About() {
  return (
    <div>
      <ul>
        <li>
          The cards used here are from{" "}
          <a href="https://cardsagainsthumanity.com">Cards Against Humanity</a>,
          and are available under a{" "}
          <a href="https://creativecommons.org/licenses/by-nc-sa/2.0/">
            Creative Commons By-NC-SA 2.0 license.
          </a>
        </li>
        <li>
          Card set open sourced by Chris Hallberg:{" "}
          <a href="https://www.crhallberg.com/cah/">JSON data set</a>
        </li>
        <li>
          This app was built by Jeremiah Coleman
          <ul>
            <li>
              <a href="https://www.linkedin.com/in/colemanja91/">LinkedIn</a>
            </li>
            <li>
              <a href="https://github.com/colemanja91">Github</a>
            </li>
          </ul>
        </li>
        <li>
          This game is intended to be played via a desktop browser. It{" "}
          <i>might</i> work on mobile browsers, but mobile development is not my
          strong suite. (Hell, front-end dev isn't my cup of tea either).
        </li>
        <li>
          If you find any bugs, or have feature requests, feel free to email me
          at{" "}
          <a href="mailto:webmaster@isolation.games">
            webmaster@isolation.games
          </a>
          . I'll try to fix any bugs that directly impact playability, anything
          else will be considered as I have time.
        </li>
        <li>
          I built this because, during the lockdown required for COVID-19, I
          really miss playing with friends and coworkers. I figured, with all
          the horribleness, it would be great to have some fun horribleness too.
        </li>
      </ul>

      <b>Privacy stuff</b>
      <ul>
        <li>
          We track your email address for the purpose of maintaining user
          accounts.
        </li>
        <li>
          We may track basic information such as device type, and app activity
          for the purpose of building a slightly less shitty game.
        </li>
        <li>We will never email you about anything.</li>
        <li>We will never sell your email address.</li>
        <li>
          Children under 13 are not allowed to use this site (recommended age is
          17+).
        </li>
        <li>
          If you want your information removed from our database,{" "}
          <a href="mailto:webmaster@isolation.games">contact us.</a>
        </li>
      </ul>

      <b>Technical stuff (for my fellow nerds)</b>
      <ul>
        <li>Backend: Ruby on Rails</li>
        <li>API: GraphQL</li>
        <li>Frontend: React</li>
        <li>Deployment: AWS Elastic Beanstalk + Aurora PostgreSQL</li>
        <li>
          Contributing: if you want to contribute to this project, I always
          welcome assistance on making the front-end better. Legally, I cannot
          accept any monetary contributions.
        </li>
      </ul>
    </div>
  );
}

export default About;
