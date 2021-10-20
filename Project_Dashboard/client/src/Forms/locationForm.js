import React from 'react';
import { useState } from 'react';
import Axios from 'axios';

function LocationForm() {
  const [locationID, setLocationID] = useState('');
  const [locationLongitude, setLocationLongitude] = useState('');
  const [locationLatitude, setLocationLatitude] = useState('');
  const [locationDescription, setLocationDescription] = useState('');
  //const [locationURL, setLocationURL] = useState('');

  const addLocation = () => {
    Axios.post('http://localhost:3001/addlocation', {
      locationid: locationID,
      locationlongitude: locationLongitude,
      locationlatitude: locationLatitude,
      locationdescription: locationDescription,
    }).then(() => {
      console.log('Successfully added a location');
    });
  };

  return (
    <div>
      <form>
        <p className="font-weight-bold text-left">ADD A NEW LOCATION</p>
        <div className="form-group">
          <label>Location ID: </label>
          <input
            className="form-control"
            type="text"
            onChange={(event) => {
              setLocationID(event.target.value);
            }}
          />
        </div>
        <div className="form-group">
          <label>Location Longitude: </label>
          <input
            className="form-control"
            type="text"
            onChange={(event) => {
              setLocationLongitude(event.target.value);
            }}
          />
        </div>
        <div className="form-group">
          <label>Location Latitude: </label>
          <input
            className="form-control"
            type="text"
            onChange={(event) => {
              setLocationLatitude(event.target.value);
            }}
          />
        </div>
        <div className="form-group">
          <label>Location Description: </label>
          <input
            className="form-control"
            type="text"
            onChange={(event) => {
              setLocationDescription(event.target.value);
            }}
          />
        </div>
        {/* <div className="form-group">
          <label>Location URL: </label>
          <input
            className="form-control"
            type="text"
            onChange={(event) => {
              setLocationURL(event.target.value);
            }}
          />
        </div> */}
        <div className="form-group py-1">
          <button className="btn btn-primary" onClick={addLocation}>
            Add Location
          </button>
        </div>
      </form>
    </div>
  );
}
export default LocationForm;
