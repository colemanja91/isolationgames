import React from "react";
import Button from "@material-ui/core/Button";
import GoogleButton from "react-google-button";
import CssBaseline from "@material-ui/core/CssBaseline";
import Instructions from "./Instructions";
import Link from "@material-ui/core/Link";
import { makeStyles } from "@material-ui/core/styles";
import Container from "@material-ui/core/Container";

const useStyles = makeStyles((theme) => ({
  paper: {
    marginTop: theme.spacing(8),
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: "100%", // Fix IE 11 issue.
    marginTop: theme.spacing(1),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

function Login() {
  const classes = useStyles();

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <div className={classes.paper}>
        <img src="/logo.jpg" alt="Isolation Games" width="400" />
        <Instructions />
        <br></br>
        <br></br>
        <GoogleButton
          onClick={() => {
            window.location.href = "/users/auth/google_oauth2";
          }}
        />
        <Button>
          <Link href="/about-public" variant="body2">
            {"About"}
          </Link>
        </Button>
      </div>
    </Container>
  );
}

export default Login;
