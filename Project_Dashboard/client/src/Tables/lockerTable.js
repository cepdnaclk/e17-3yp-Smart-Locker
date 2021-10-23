import Axios from 'axios';
import { useState } from 'react';

import '../Global/globalvariables';

import { AiOutlineDelete } from 'react-icons/ai';

function LockerTable() {
  const [lockerList, setLockerList] = useState([]);

  const getLocker = () => {
    Axios.get(`${global.url}/sendlocker`).then((response) => {
      //console.log(response);
      setLockerList(response.data);
    });
  };

  const deletelocker = (lockerid) => {
    Axios.delete(`${global.url}/deletelocker/${lockerid}`).then((response) => {
      console.log(lockerid);
      //console.log('Successfully Deleted a Locker ');
      console.log(response);
    });
  };

  getLocker();

  const renderlockerlist = (val, key) => {
    return (
      <tr key={key}>
        <td>{key}</td>
        <td>{val.LockerID}</td>
        <td>{val.LockerUserID}</td>
        <td>{val.LockerLocationId}</td>
        <td>{val.Availability}</td>
        <td>{val.ExpireDate}</td>
        <td>{val.IsEmpty}</td>
        <td>{val.LockerNumber}</td>
        <td>
          <button
            onClick={() => {
              deletelocker(val.LockerID);
              //console.log(val.LockerID);
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
        <table className="table table-bordered mx-2 my-3">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Locker ID</th>
              <th scope="col">Locker User ID</th>
              <th scope="col">Locker Location ID</th>
              <th scope="col">Availability</th>
              <th scope="col">ExpireDate</th>
              <th scope="col">IsEmpty</th>
              <th scope="col">Locker Number</th>
            </tr>
          </thead>
          <tbody>{lockerList.map(renderlockerlist)}</tbody>
        </table>
      </div>
    </div>
  );
}

export default LockerTable;
