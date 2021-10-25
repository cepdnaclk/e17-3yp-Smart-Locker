import React from 'react';
import { useState } from 'react';
import Axios from 'axios';

import { MdAddLocationAlt } from 'react-icons/md';

import '../Global/globalvariables';
import Topbar from '../Components/Topbar';

function LocationForm() {
  const [locationID, setLocationID] = useState('');
  const [locationLongitude, setLocationLongitude] = useState('');
  const [locationLatitude, setLocationLatitude] = useState('');
  const [locationDescription, setLocationDescription] = useState('');
  //const [locationURL, setLocationURL] = useState('');

  const addLocation = () => {
    Axios.post(`${global.url}/api/location/add`, {
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
      <Topbar />
      <div>
        <h3 class="top_margin">
          <MdAddLocationAlt size={36} className="right_mar" />
          ADD A LOCATION
        </h3>
      </div>
      <div>
        <div className="row">
          <div className="col"></div>
          <div className="col-7">
            <form className="border border-primary rounded p-2">
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
                <button
                  className="btn btn-primary rounded-pill"
                  onClick={addLocation}
                >
                  Add Location
                </button>
              </div>
            </form>
          </div>
          <div className="col"></div>
        </div>
      </div>
    </div>
  );
}
export default LocationForm;
