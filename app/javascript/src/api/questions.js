import humps from 'humps';
import api from './api';

export default {
  getAll(courseId, params = {}) {
    return api({
      method: 'get',
      url: `/api/v1/courses/${courseId}/questions`,
      params: humps.decamelizeKeys(params),
    });
  },
  create(courseId, body) {
    return api({
      method: 'post',
      url: `/api/v1/courses/${courseId}/questions`,
      data: {
        question: { body }
      },
    });
  },
  delete(courseId, questionId) {
    return api({
      method: 'delete',
      url: `/api/v1/courses/${courseId}/questions/${questionId}`,
    });
  },
};
