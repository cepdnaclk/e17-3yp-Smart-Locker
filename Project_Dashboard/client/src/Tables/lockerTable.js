import Axios from 'axios';
import { useState } from 'react';

import '../Global/globalvariables';
import Topbar from '../Components/Topbar';

import { AiOutlineDelete } from 'react-icons/ai';
import { GiLockers } from 'react-icons/gi';

function LockerTable() {
  const [lockerList, setLockerList] = useState([]);

  const getLocker = () => {
    Axios.get(`${global.url}/api/locker`).then((response) => {
      console.log(response);
      setLockerList(response.data);
    });
  };

  const deletelocker = (lockerid) => {
    Axios.delete(`${global.url}/api/locker/delete/${lockerid}`).then(
      (response) => {
        console.log(lockerid);
        //console.log('Successfully Deleted a Locker ');
        console.log(response);
      }
    );
  };

  getLocker();

  const renderlockerlist = (val, key) => {
    return (
      <tr key={key}>
        <td>{key}</td>
        <td>{val.LockerID}</td>
        <td>{val.LockerUserID}</td>
        <td>{val.LockerLocationID}</td>
        <td>{val.Availability}</td>
        <td>{val.ExpireDate}</td>
        <td>{val.IsEmpty}</td>
        <td>{val.LockerNumber}</td>
        <td>
          <button
            className="btn btn-danger"
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
      <Topbar />
      <h1 class="top_margin ">
        <GiLockers size={36} className="right_mar" />
        Lockers
      </h1>
      <div class="x_margin">
        <table className="table table-bordered">
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
              <th></th>
            </tr>
          </thead>
          <tbody>{lockerList.map(renderlockerlist)}</tbody>
        </table>
      </div>
    </div>
  );
}

export default LockerTable;
