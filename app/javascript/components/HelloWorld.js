import React from "react"
import PropTypes from "prop-types"
import { withStyles } from '@material-ui/core/styles';
import Button from "@material-ui/core/Button";

const styles = {
  image: {
    maxWidth:'100%',
    height: 'auto',
    width: 'auto'
  }
}

class HelloWorld extends React.Component {
  render () {
    return (
      <React.Fragment>
        <img src="/assets/zcenterimage.jpeg" style={ styles.image }/>
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  name: PropTypes.string
};
export default HelloWorld
