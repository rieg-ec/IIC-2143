import api from './api';

export default {
  get(subject) {
    return api({
      method: 'get',
      url: `/api/v1/books?subject=${subject}`,
    });
  },
};
