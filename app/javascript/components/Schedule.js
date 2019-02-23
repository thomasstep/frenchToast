import React from "react"
import PropTypes from "prop-types"
import TextField from '@material-ui/core/TextField';
import Grid from '@material-ui/core/Grid'

const styles = {
  twoColumnRow: {
    paddingLeft: '25% - 94.5'
  }
}

class Schedule extends React.Component {
  state = {
    firstName: "",
    lastName: "",
    email: "",
    phone: "",
    vehicleYear: "",
    vehicleMake: "",
    vehicleModel: "",
    desiredDate: "",
    desiredTime: "",
    reason: ""
  }

  render () {
    return (
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3 offset-md-2">
            <TextField
              id="firstName"
              label="First Name"
              value={this.state.firstName}
              variant="outlined"
              style={ styles.twoColumnRow }
            />
          </div>
          <div class="col-md-3 offset-md-2">
            <TextField
              id="lastName"
              label="Last Name"
              value={this.state.lastName}
              variant="outlined"
            />
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 offset-md-2">
            <TextField
              id="email"
              label="Email"
              value={this.state.email}
              variant="outlined"
            />
          </div>
          <div class="col-md-3 offset-md-2">
            <TextField
              id="phone"
              label="Phone"
              value={this.state.phone}
              variant="outlined"
            />
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 offset-md-2">
            <TextField
              id="vehicleYear"
              label="Vehicle Year"
              value={this.state.vehicleYear}
              variant="outlined"
            />
          </div>
          <div class="col-md-2">
            <TextField
              id="vehicleMake"
              label="Vehicle Make"
              value={this.state.vehicleMake}
              variant="outlined"
            />
          </div>
          <div class="col-md-3">
            <TextField
              id="vehicleModel"
              label="Vehicle Model"
              value={this.state.vehicleModel}
              variant="outlined"
            />
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 offset-md-2">
            <TextField
              id="desiredDate"
              label="Desired Date"
              value={this.state.desiredDate}
              variant="outlined"
            />
          </div>
          <div class="col-md-3 offset-md-2">
            <TextField
              id="desiredTime"
              label="Desired Time"
              value={this.state.desiredTime}
              variant="outlined"
            />
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 offset-md-4">
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Schedule
