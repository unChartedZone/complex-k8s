import React from "react";
import { Link } from "react-router-dom";

const OtherPageStyles = {
  margin: "10rem 0",
};

const OtherPage = () => {
  return (
    <div style={OtherPageStyles}>
      Im some other page!
      <Link to="/">Go back home</Link>
    </div>
  );
};

export default OtherPage;
