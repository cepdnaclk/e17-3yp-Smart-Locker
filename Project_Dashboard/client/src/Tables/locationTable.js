import Axios from 'axios';
import { useState } from 'react';

function LocationTable() {
  const [locationList, setLocationList] = useState([]);

  const getLocation = () => {
    Axios.get('http://localhost:3001/sendlocation').then((response) => {
      //console.log(response);
      setLocationList(response.data);
    });
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
      </tr>
    );
  };
  return (
    <div>
      <div>
        <table className="table table-bordered mx-2 my-3">
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
