import humps from 'humps';
import api from './api';

const path = '/api/v1/questions';

export default {
  getAll(params = {}) {
    return api({
      method: 'get',
      url: path,
      params: humps.decamelizeKeys(params),
    });
  },
  create(courseId, question) {
    return api({
      method: 'post',
      url: path,
      data: {
        ...humps.decamelizeKeys(question),
        ...humps.decamelizeKeys({ courseId }),
      },
    });
  },
  delete(questionId) {
    return api({
      method: 'delete',
      url: `${path}/${questionId}`,
    });
  },
};
