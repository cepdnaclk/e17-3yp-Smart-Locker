//import './form.css';
import React from 'react';
import Axios from 'axios';
import 'bootstrap/dist/css/bootstrap.css';
import { useState } from 'react';

import { MdAddModerator } from 'react-icons/md';

import '../Global/globalvariables';

function LockerForm() {
  const [lockerID, setLockerID] = useState('');
  const [lockerNumber, setLockerNumber] = useState('');
  const [lockerLocationID, setLockerLocationID] = useState('');

  const addLocker = () => {
    Axios.post(`${global.url}/api/locker/add`, {
      lockerid: lockerID,
      lockerlocationid: lockerLocationID,
      lockernumber: lockerNumber,
    }).then(() => {
      console.log('Successfully added a locker');
    });
  };
  return (
    <div>
      <h3 class="top_margin">
        <MdAddModerator size={36} className="right_mar" />
        ADD A NEW LOCKER
      </h3>
      <div className="row">
        <div className="col"></div>
        <div className="col-7">
          <form className="border border-primary rounded p-2">
            <div className="form-group">
              <label>Locker ID: </label>
              <input
                className="form-control"
                type="text"
                onChange={(event) => {
                  setLockerID(event.target.value);
                }}
              />
            </div>
            <div className="form-group">
              <label>Locker Number: </label>
              <input
                className="form-control"
                type="Number"
                onChange={(event) => {
                  setLockerNumber(event.target.value);
                }}
              />
            </div>
            <div className="form-group">
              <label>Location ID: </label>
              <input
                className="form-control"
                type="Number"
                onChange={(event) => {
                  setLockerLocationID(event.target.value);
                }}
              />
            </div>
            <div className="form-group py-1">
              <button
                className="btn btn-primary rounded-pill"
                onClick={addLocker}
              >
                Add Locker
              </button>
            </div>
          </form>
        </div>
        <div className="col"></div>
      </div>
    </div>
  );
}
export default LockerForm;
