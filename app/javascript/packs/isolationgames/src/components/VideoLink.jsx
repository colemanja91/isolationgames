import React, { useState } from "react";
import Button from "@material-ui/core/Button";
import Link from "@material-ui/core/Link";
import LaunchIcon from "@material-ui/icons/Launch";
import AddVideoLinkButton from "./AddVideoLinkButton";

function VideoLink({ videoLink, isOwner }) {
  return (
    <div>
      {videoLink ? (
        <Link href={videoLink} rel="noopener noreferrer" target="_blank">
          {videoLink}
          <LaunchIcon />
        </Link>
      ) : null}
      {isOwner ? <AddVideoLinkButton videoLink={videoLink} /> : null}
    </div>
  );
}

export default VideoLink;
