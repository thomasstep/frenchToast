import React from "react"
import PropTypes from "prop-types"
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import MenuItem from '@material-ui/icons/Menu';
import Menu from '@material-ui/icons/Menu';
import Grid from '@material-ui/core/Grid';

// const styles = {
//   button: {
//
//   }
// }

class Navbar extends React.Component {
  state = {
    open: false,
    anchorE1: null
  }

  handleClick = event => {
    this.setState({
      open: true,
      anchorE1: event.currentTarget
    });
  };

  handleClose = event => {
    this.setState({
      open: false,
      anchorE1: null
    });
  };

  render () {
    return (
      <React.Fragment>
        <AppBar color="default" position="static">
          <Toolbar>
            <Grid justify="space-between" container spacing={24}>
              <Grid item>
                <Typography variant="h6" color="inherit">
                  The Z Center
                </Typography>
              </Grid>

              <Grid item>
                <Button color="inherit">Home</Button>
                <Button color="inherit">About Us</Button>
                <Button color="inherit">Our Services</Button>
                <Button color="inherit">Schedule</Button>
                <Button color="inherit">Contact Us</Button>
                <Button color="inherit">Login</Button>
              </Grid>
            </Grid>
          </Toolbar>
        </AppBar>
      </React.Fragment>
    );
  }
}

export default Navbar
