import React from "react"
import PropTypes from "prop-types"
import Grid from '@material-ui/core/Grid'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography';

const styles = {
  image: {
    maxWidth:'100%',
    height: 'auto',
    width: 'auto'
  },
  map: {
    frameBorder: '0px',
    width: '600px',
    height: '450px',
    border: '0px',
    padding: '20px'
  },
  paper: {
    height: '456px'
  },
  typo: {
    paddingTop: '230px'
  }
}

class Welcome extends React.Component {
  render () {
    return (
      <React.Fragment>
        <img src="/assets/zcenterimage.jpeg" style={ styles.image }/>
        <Grid container spacing={8} alignItems='center'>
          <Grid item sm>
            <Paper>
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15646.006638454712!2d-95.48912691510985!3d29.728999810467386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8de0f44efc719707!2sZ+Center!5e0!3m2!1sen!2sus!4v1550705031004" style={ styles.map }></iframe>
            </Paper>
          </Grid>
          <Grid item sm>
            <Paper style={ styles.paper }>
              <Typography align='center' style={ styles.typo }>
                The Z Center
              </Typography>
              <Typography align='center'>
                3404 Bering Dr., Houston, TX 77057
              </Typography>
              <Typography align='center'>
                (713) 789-1273
              </Typography>
            </Paper>
          </Grid>
        </Grid>
      </React.Fragment>
    );
  }
}

export default Welcome
