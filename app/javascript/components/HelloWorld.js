import React from "react"
import PropTypes from "prop-types"
import Button from "@material-ui/core/Button";

class HelloWorld extends React.Component {
  render () {
    return (
      <React.Fragment>
        Hello {this.props.name}
        <Button color="inherit">Press Me</Button>
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  name: PropTypes.string
};
export default HelloWorld
