import { listFriend } from 'actions/friend';
import { getProfile } from 'actions/profile';
import Icon from 'component/BackIcon';
import Logo from 'component/Logo';
import Profile from 'component/Profile';
import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getUserList } from 'service/profile';

const Userlist = () => {
  const dispatch = useDispatch();
  const { token, friendList, profile } = useSelector(state => state);
  const [userlist, setUserlist] = useState([]);

  const filter = list => {
    const friend = friendList.data;
    if (friend.status) return list;
    return list.filter(({ id }) =>
      profile.data.id === id ? false : !friend.find(data => data.id === id),
    );
  };

  const Effect = async () => {
    const userList = await getUserList(token.data);
    setUserlist(await filter(userList));
  };

  useEffect(() => {
    if (!friendList.status) dispatch(listFriend());
    if (!profile.status) dispatch(getProfile());
  }, []);

  useEffect(() => {
    Effect();
  }, [friendList.status, profile.status]);

  return (
    <div className="Container">
      <Logo>
        <Icon />
      </Logo>
      {userlist.map(val => (
        <Profile user={val} key={val.id} />
      ))}
    </div>
  );
};

export default Userlist;