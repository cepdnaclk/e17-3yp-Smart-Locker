//import './form.css';
import React from 'react';
import Axios from 'axios';
import 'bootstrap/dist/css/bootstrap.css';
import { useState } from 'react';

function LockerForm() {
  const [lockerID, setLockerID] = useState('');
  const [lockerNumber, setLockerNumber] = useState('');
  const [lockerLocationID, setLockerLocationID] = useState('');

  const addLocker = () => {
    Axios.post('http://localhost:3001/addlocker', {
      lockerid: lockerID,
      lockerlocationid: lockerLocationID,
      lockernumber: lockerNumber,
    }).then(() => {
      console.log('Successfully added a locker');
    });
  };
  return (
    <div>
      <form>
        <p>ADD A NEW LOCKER</p>
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
          <button className="btn btn-primary" onClick={addLocker}>
            Add Locker
          </button>
        </div>
      </form>
    </div>
  );
}
export default LockerForm;
