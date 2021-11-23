import api from './api';

export default {
  update(userId, form) {
    return api({
      method: 'patch',
      url: `/users/${userId}`,
      data: form,
    });
  },
};
