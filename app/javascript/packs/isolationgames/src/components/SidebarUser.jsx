import React, { Fragment } from "react";
import ListItem from "@material-ui/core/ListItem";
import Typography from "@material-ui/core/Typography";
import ChangeDisplayName from "./ChangeDisplayName";

function SidebarUser({ user }) {
  return (
    <div className="sidebar-user">
      <Fragment>
        <Typography variant="h4">Playing as:</Typography>
        <ListItem className="sidebar-item">
          <Typography>{user.displayName} </Typography>
          <ChangeDisplayName user={user} />
        </ListItem>
        <ListItem className="sidebar-item">
          <Typography>
            Email: <i>{user.email}</i>
          </Typography>
        </ListItem>
      </Fragment>
    </div>
  );
}

export default SidebarUser;
