import { useState } from 'react';
import Axios from 'axios';

import '../Global/globalvariables';

import * as ReactBootStrap from 'react-bootstrap';
import { AiOutlineDelete } from 'react-icons/ai';

function UserTable() {
  const [userList, setUserList] = useState([]);

  const deleteUser = (useremail) => {
    Axios.delete(`${global.url}/deleteuser/${useremail}`).then((response) => {
      console.log('Successfully Deleted the User');
      console.log(response);
    });
  };

  const getUser = () => {
    Axios.get(`${global.url}/senduser`).then((response) => {
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
      {/* <div>
        {
          <button className="btn btn-secondary" onClick={getUser}>
            Show User
          </button>
        }
      </div> */}
      <div>
        <ReactBootStrap.Table className="table table-bordered mx-2 my-3">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Mail</th>
              <th>Mobile</th>
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
