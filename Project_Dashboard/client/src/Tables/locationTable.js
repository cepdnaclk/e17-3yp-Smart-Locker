import Axios from 'axios';
import { useState } from 'react';

import '../Global/globalvariables';
import { AiOutlineDelete } from 'react-icons/ai';

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
      <div>
        <table className="table table-striped m-4">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Location ID</th>
              <th scope="col">Longitude</th>
              <th scope="col">Latitude</th>
              <th scope="col">Description</th>
            </tr>
          </thead>
          <tbody>{locationList.map(renderlocationlist)}</tbody>
        </table>
      </div>
    </div>
  );
}
export default LocationTable;
