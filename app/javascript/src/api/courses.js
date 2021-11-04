import humps from 'humps';
import api from './api';

const path = '/api/v1/courses';

export default {
  getAll() {
    return api({
      method: 'get',
      url: path,
    });
  },
  register(courseId) {
    return api({
      method: 'post',
      url: `${path}/${courseId}/register`,
    });
  },
};
