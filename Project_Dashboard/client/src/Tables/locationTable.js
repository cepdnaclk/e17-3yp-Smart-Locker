import Axios from 'axios';
import { useState } from 'react';

import '../Styles/styles.css';
import '../Global/globalvariables';

import { AiOutlineDelete } from 'react-icons/ai';
import { MdLocationOn } from 'react-icons/md';

function LocationTable() {
  const [locationList, setLocationList] = useState([]);

  const getLocation = () => {
    Axios.get(`${global.url}/sendlocation`).then((response) => {
      //console.log(response);
      setLocationList(response.data);
    });
  };

  const deletelocation = (locationid) => {
    Axios.delete(`${global.url}/deletelocation/${locationid}`).then(
      (response) => {
        // console.log('Successfully Deleted the Location');
        // console.log(response);
        if (response.status === 500) {
          console.log(response.status);
        }
      }
    );
  };
  getLocation();

  const renderlocationlist = (val, key) => {
    return (
      <tr key={key}>
        <td>{key}</td>
        <td>{val.LocationID}</td>
        <td>{val.Longitude}</td>
        <td>{val.Latitude}</td>
        <td>{val.LocationDescription}</td>
        <td>
          <button
            className="btn btn-danger"
            onClick={() => {
              deletelocation(val.LocationID);
            }}
          >
            <AiOutlineDelete />
          </button>
        </td>
      </tr>
    );
  };
  return (
    <div>
      <h1 class="top_margin">
        <MdLocationOn size={36} className="right_mar" />
        Locations
      </h1>
      <div class="x_margin">
        <table className="table table-bordered ">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Location ID</th>
              <th scope="col">Longitude</th>
              <th scope="col">Latitude</th>
              <th scope="col">Description</th>
              <th></th>
            </tr>
          </thead>
          <tbody>{locationList.map(renderlocationlist)}</tbody>
        </table>
      </div>
    </div>
  );
}
export default LocationTable;
