import { useState } from 'react';
import Axios from 'axios';

import '../Global/globalvariables';
import Topbar from '../Components/Topbar';

import * as ReactBootStrap from 'react-bootstrap';
import { AiOutlineDelete } from 'react-icons/ai';
import { FaUserAlt } from 'react-icons/fa';

function UserTable() {
  const [userList, setUserList] = useState([]);

  const deleteUser = (useremail) => {
    Axios.delete(`${global.url}/api/admin/delete/${useremail}`).then(
      (response) => {
        console.log('Successfully Deleted the User');
        //console.log(response);
      }
    );
  };

  const getUser = () => {
    Axios.get(`${global.url}/api/admin`).then((response) => {
      //console.log(response);
      setUserList(response.data);
    });
  };

  // const renderUser = (val, key) => {
  //   return (
  //     <tr key={key}>
  //       <td>{key}</td>
  //       <td>{val.UserName}</td>
  //       <td>{val.UserEmail}</td>
  //       <td>{val.MobileNumber}</td>
  //       <td>
  //         <button onClick={deleteUser(val.UserID)}>D</button>
  //       </td>
  //     </tr>
  //   );
  // };
  getUser();
  return (
    <div>
      <Topbar />
      <h1 class="top_margin ">
        <FaUserAlt size={28} className="right_mar" />
        Users
      </h1>
      <div class="x_margin">
        <ReactBootStrap.Table className="table table-bordered border-secondary">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Mail</th>
              <th>Mobile</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {userList.map((val, key) => {
              return (
                <tr key={key}>
                  <td>{key}</td>
                  <td>{val.UserName}</td>
                  <td>{val.UserEmail}</td>
                  <td>{val.MobileNumber}</td>
                  <td>
                    <button
                      className="btn btn-danger"
                      onClick={() => {
                        deleteUser(val.UserEmail);
                      }}
                    >
                      <AiOutlineDelete />
                    </button>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </ReactBootStrap.Table>
      </div>
    </div>
  );
}
export default UserTable;
