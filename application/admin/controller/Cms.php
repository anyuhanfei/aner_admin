<?php
namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Request;
use think\Loader;
use think\Cookie;

use app\admin\model\CmsTag;
use app\admin\model\CmsCategory;
use app\admin\model\LogAdminOperation;
use app\admin\model\CmsArticle;
use app\admin\model\CmsArticleData;
use app\admin\model\CmsArticleComment;


class Cms extends Base{
    private $cms_hint_array = array(
        'tag_ids'=> '请选择标签',
        'author'=> '请填写作者',
        'intro'=> '请填写内容',
        'keyword'=> '请填写关键字',
        'content_type'=> '请选择内容类型',
    );

    public function _initialize(){
        parent::_initialize();
        $this->assign('cms_tag_image_onoff', $this->cms_tag_image_onoff);
        $this->assign('cms_category_image_onoff', $this->cms_category_image_onoff);
        $this->assign('cms_article', $this->cms_article);
    }

    /**
     * 文章标签管理-列表
     *
     * @return void
     */
    public function tag(){
        $list = CmsTag::order('sort asc, tag_id desc')->select();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 文章标签信息添加表单
     */
    public function tag_add(){
        $max_sort = CmsTag::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        return $this->fetch();
    }

    /**
     * 文章标签信息添加提交
     *
     * @return void
     */
    public function tag_add_submit(){
        $tag_name = Request::instance()->param('tag_name', '');
        $sort = Request::instance()->param('sort', '');
        $tag_image = Request::instance()->file('tag_image');
        $validate = Loader::validate('tag');
        if(!$validate->scene('add')->check(['tag_name'=> $tag_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_tag_image_onoff == 'on'){
            if(!$tag_image){
                return return_data(2, '', '请上传标签图片');
            }
            $image_res = file_upload($tag_image, 'tag');
            $path = $image_res['file_path'];
        }
        $res = CmsTag::create(['tag_name'=> $tag_name, 'sort'=> $sort, 'tag_image'=> $path]);
        if($res){
            LogAdminOperation::create_data('文章标签信息添加：'.$tag_name, 'operation');
            return return_data(1, '', '添加成功');
        }else{
            if($path != ''){
                delete_image($path);
            }
            return return_data(2, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 文章标签信息修改表单
     *
     * @return void
     */
    public function tag_update($id){
        $tag = CmsTag::get($id);
        $has_data = "true";
        if(!$tag){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $tag);
        return $this->fetch();
    }

    /**
     * 文章标签信息修改提交
     *
     * @return void
     */
    public function tag_update_submit($id){
        $tag_name = Request::instance()->param('tag_name', '');
        $sort = Request::instance()->param('sort', '');
        $tag_image = Request::instance()->file('tag_image');
        $validate = Loader::validate('tag');
        if(!$validate->scene('update')->check(['tag_name'=> $tag_name, 'sort'=> $sort, 'tag_id'=> $id])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_tag_image_onoff == 'on'){
            if($tag_image){
                $image_res = file_upload($tag_image, 'tag');
                $path = $image_res['file_path'];
            }
        }
        $tag = CmsTag::get($id);
        $old_path = $tag->tag_image;
        $old_tag_name = $tag->tag_name;
        $tag->tag_name = $tag_name;
        $tag->sort = $sort;
        $tag->tag_image = $path == '' ? $tag->tag_image : $path;
        $res = $tag->save();
        if($res){
            $path != '' ? delete_image($old_path) : false;
            LogAdminOperation::create_data('文章标签信息修改：'.$old_tag_name.'->'.$tag->tag_name, 'operation');
            return return_data(1, array('tag_id'=> $tag->tag_id, 'tag_image'=> $tag->tag_image), '修改成功');
        }else{
            $path != '' ? delete_image($path) : false;
            return return_data(2, '', '修改失败或没有要修改的信息');
        }
    }

    /**
     * 文章标签信息删除提交
     *
     * @return void
     */
    public function tag_delete_submit($id){
        $tag = CmsTag::get($id);
        $res = CmsTag::where('tag_id', $id)->delete();
        if($res){
            delete_image($tag->tag_image);
            LogAdminOperation::create_data('文章标签信息删除：'.$tag->tag_name, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 文章分类管理-列表
     *
     * @return void
     */
    public function category(){
        $list = CmsCategory::order('sort asc, category_id desc')->select();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 文章分类信息添加表单
     */
    public function category_add(){
        $max_sort = CmsCategory::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        return $this->fetch();
    }

    /**
     * 文章分类信息添加提交
     *
     * @return void
     */
    public function category_add_submit(){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', '');
        $category_image = Request::instance()->file('category_image');
        $validate = Loader::validate('category');
        if(!$validate->scene('add')->check(['category_name'=> $category_name, 'sort'=> $sort])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_category_image_onoff == 'on'){
            if(!$category_image){
                return return_data(2, '', '请上传标签图片');
            }
            $image_res = file_upload($category_image, 'category');
            $path = $image_res['file_path'];
        }
        $res = CmsCategory::create(['category_name'=> $category_name, 'sort'=> $sort, 'category_image'=> $path]);
        if($res){
            LogAdminOperation::create_data('文章分类信息添加：'.$category_name, 'operation');
            return return_data(1, '', '添加成功');
        }else{
            if($path != ''){
                delete_image($path);
            }
            return return_data(2, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 文章分类信息修改表单
     *
     * @return void
     */
    public function category_update($id){
        $category = CmsCategory::get($id);
        $has_data = "true";
        if(!$category){
            $has_data = "false";
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $category);
        return $this->fetch();
    }

    /**
     * 文章分类信息修改提交
     *
     * @return void
     */
    public function category_update_submit($id){
        $category_name = Request::instance()->param('category_name', '');
        $sort = Request::instance()->param('sort', '');
        $category_image = Request::instance()->file('category_image');
        $validate = Loader::validate('category');
        if(!$validate->scene('update')->check(['category_name'=> $category_name, 'sort'=> $sort, 'category_id'=> $id])){
            return return_data(2, '', $validate->getError());
        }
        $path = '';
        if($this->cms_category_image_onoff == 'on'){
            if($category_image){
                $image_res = file_upload($category_image, 'category');
                $path = $image_res['file_path'];
            }
        }
        $category = CmsCategory::get($id);
        $old_path = $category->category_image;
        $old_category_name = $category->category_name;
        $category->category_name = $category_name;
        $category->sort = $sort;
        $category->category_image = $path == '' ? $category->category_image : $path;
        $res = $category->save();
        if($res){
            $path != '' ? delete_image($old_path) : false;
            LogAdminOperation::create_data('文章分类信息修改：'.$old_category_name.'->'.$category->category_name, 'operation');
            return return_data(1, array('category_id'=> $category->category_id, 'category_image'=> $category->category_image), '修改成功');
        }else{
            $path != '' ? delete_image($path) : false;
            return return_data(2, '', '修改失败或没有要修改的信息');
        }
    }

    /**
     * 文章分类信息删除提交
     *
     * @return void
     */
    public function category_delete_submit($id){
        $category = CmsCategory::get($id);
        $res = CmsCategory::where('category_id', $id)->delete();
        if($res){
            delete_image($category->category_image);
            LogAdminOperation::create_data('文章分类信息删除：'.$category->category_name, 'operation');
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 文章管理-列表
     *
     * @return void
     */
    public function article(){
        $title = Request::instance()->param('title', '');
        $category_id = Request::instance()->param('category_id', '');
        $tag_id = Request::instance()->param('tag_id', '');
        $author = Request::instance()->param('author', '');

        $field = 'article_id, category_id, tag_ids, title, author, intro, keyword, image, sort, content_type';
        $article = new CmsArticle;
        $article = $article->field($field);
        $article = ($title != '') ? $article->where('title', 'like', '%' . $title . '%') : $article;
        $article = ($category_id != '') ? $article->where('category_id', $category_id) : $article;
        $article = ($tag_id != '') ? $article->where('tag_ids', 'like', '%,' . $tag_id . ',%') : $article;
        $article = ($author != '') ? $article->where('author', 'like', '%' . $author . '%') : $article;
        $list = $article->order('sort asc, article_id desc')->paginate($this->page_number, false,['query'=>request()->param()]);
        foreach($list as &$l){
            $l['tag_ids'] = CmsTag::where('tag_id', 'in', $l['tag_ids'])->column('tag_name');
            $l['tag_ids'] = implode(',', $l['tag_ids']);
        }
        //删除未被上传的图片
        $article_images = Cookie::get('article_content_images');
        if($article_images){
            foreach($article_images as $k => $v){
                delete_image($v);
                unset($article_images[$k]);
            }
        }
        Cookie::set('article_content_images');
        self::many_assign(['list'=> $list, 'title'=> $title, 'category_id'=> $category_id, 'tag_id'=> $tag_id, 'author'=> $author]);
        //分类和标签
        $category = CmsCategory::field('category_id, category_name, sort')->order('sort asc')->select();
        $tag = CmsTag::field('tag_id, tag_name, sort')->order('sort asc')->select();
        $this->assign('category', $category);
        $this->assign('tag', $tag);
        return $this->fetch();
    }

    /**
     * 文章信息添加
     *
     * @return void
     */
    public function article_add(){
        $max_sort = CmsArticle::order('sort desc')->value('sort');
        $this->assign('max_sort', $max_sort);
        $category = CmsCategory::field('category_id, category_name, sort')->order('sort asc')->select();
        $tag = CmsTag::field('tag_id, tag_name, sort')->order('sort asc')->select();
        $this->assign('category', $category);
        $this->assign('tag', $tag);
        return $this->fetch();
    }

    /**
     * 文章信息添加提交
     *
     * @return void
     */
    public function article_add_submit(){
        $title = Request::instance()->param('title', '');
        $category_id = Request::instance()->param('category_id', '');
        $tag_ids = Request::instance()->param('tag_ids', '');
        $author = Request::instance()->param('author', '');
        $keyword = Request::instance()->param('keyword', '');
        $intro = Request::instance()->param('intro', '');
        $content_type = Request::instance()->param('content_type', '');
        $sort = Request::instance()->param('sort', '');
        $content = Request::instance()->param('content', '');
        $image = Request::instance()->file('image');
        $validate = Loader::validate('article');
        if(!$validate->scene('add')->check(['title'=> $title, 'sort'=> $sort, 'category_id'=> $category_id])){
            return return_data(2, '', $validate->getError());
        }
        if($author == ''){
            $author = $this->admin->nickname;
        }
        foreach($this->cms_article as $k => $v){
            if($k != 'image'){
                if($v == 'on'){
                    if($$k == ''){
                        return return_data(2, '', $this->cms_hint_array[$k]);
                    }else{
                        $data[$k] = $$k;
                    }
                }
            }
        }
        if($this->cms_article['image'] == 'on'){
            if($image){
                $image_res = file_upload($image, 'article');
                $data['image'] = $image_res['file_path'];
            }else{
                return return_data(2, '', '请上传图片');
            }
        }
        $data['title'] = $title;
        $data['category_id'] = $category_id;
        $data['sort'] = $sort;
        $data['content'] = $content;
        $article = CmsArticle::create($data);
        if($article){
            self::remove_article_content_image($content);
            LogAdminOperation::create_data('文章信息添加：'.$title, 'operation');
            CmsArticleData::create(['article_id'=> $article->article_id]);
            return return_data(1, '', '添加成功');
        }else{
            if($data['image'] != ''){
                delete_image($data['image']);
            }
            return return_data(2, '', '添加失败，请联系管理员');
        }
    }

    /**
     * 文章信息修改
     *
     * @param [type] $id
     * @return void
     */
    public function article_update($id){
        $article = CmsArticle::get($id);
        $has_data = "true";
        if(!$article){
            $has_data = "false";
        }
        $category = CmsCategory::field('category_id, category_name, sort')->order('sort asc')->select();
        $tag = CmsTag::field('tag_id, tag_name, sort')->order('sort asc')->select();
        foreach($tag as &$v){
            if(strpos($article->tag_ids, ",$v->tag_id,") === false){
                $v['has_tag'] = 0;
            }else{
                $v['has_tag'] = 1;
            }
        }
        $this->assign('has_data', $has_data);
        $this->assign('detail', $article);
        $this->assign('category', $category);
        $this->assign('tag', $tag);
        return $this->fetch();
    }

    /**
     * 文章信息修改提交
     *
     * @param [type] $id
     * @return void
     */
    public function article_update_submit($id){
        $title = Request::instance()->param('title', '');
        $category_id = Request::instance()->param('category_id', '');
        $tag_ids = Request::instance()->param('tag_ids', '');
        $author = Request::instance()->param('author', '');
        $keyword = Request::instance()->param('keyword', '');
        $intro = Request::instance()->param('intro', '');
        $content_type = Request::instance()->param('content_type', '');
        $sort = Request::instance()->param('sort', '');
        $content = Request::instance()->param('content', '');
        $image = Request::instance()->file('image');
        $validate = Loader::validate('article');
        if(!$validate->scene('update')->check(['article_id'=> $id, 'title'=> $title, 'sort'=> $sort, 'category_id'=> $category_id])){
            return return_data(2, '', $validate->getError());
        }
        $article = CmsArticle::get($id);
        $article->author = $author == '' ? $this->admin->nickname : $author;
        foreach($this->cms_article as $k => $v){
            if($k != 'image'){
                if($v == 'on'){
                    if($$k == ''){
                        return return_data(2, '', $this->cms_hint_array[$k]);
                    }else{
                        $article->$k = $$k;
                    }
                }
            }
        }
        $old_image = '';
        if($this->cms_article['image'] == 'on'){
            if($image){
                $image_res = file_upload($image, 'article');
                $article->image = $image_res['file_path'];
                $old_image = $article->image;
            }
        }
        $old_title = $article->title;
        $article->title = $title;
        $article->category_id = $category_id;
        $article->sort = $sort;
        $article->content = $content;
        $res = $article->save();
        if($res){
            self::remove_article_content_image($content);
            LogAdminOperation::create_data('文章信息修改：'.$old_title . '->' . $title, 'operation');
            return return_data(1, '', '修改成功');
        }else{
            if($old_image != ''){
                delete_image($old_image);
            }
            return return_data(2, '', '修改失败，请联系管理员');
        }
    }

    /**
     * 文章信息删除提交
     *
     * @param [type] $id
     * @return void
     */
    public function article_delete_submit($id){
        $article = CmsArticle::get($id);
        $res = CmsArticle::where('article_id', $id)->delete();
        if($res){
            delete_image($article->image);
            self::remove_article_content_image($article->content, 'delete');
            LogAdminOperation::create_data('文章信息删除：'.$article->title, 'operation');
            CmsArticleData::where('article_id', $id)->delete();
            return return_data(1, '', '删除成功');
        }else{
            return return_data(3, '', '删除失败,请联系管理员');
        }
    }

    /**
     * 文章信息内容获取
     *
     * @param [type] $id
     * @return void
     */
    public function article_content($id){
        $article = CmsArticle::field('article_id, content_type, content')->where('article_id', $id)->find();
        return return_data(1, $article, '内容');
    }

    /**
     * 文章信息上传图片提交
     *
     * @return void
     */
    public function article_img(){
        $image = Request::instance()->file('upload');
        $image_res = file_upload($image, 'article_content');
        $path = $image_res['file_path'];
        if(!Cookie::has('article_content_images')){
            Cookie::set('article_content_images', []);
        }
        $cookie_images = Cookie::get('article_content_images');
        array_push($cookie_images, $path);
        Cookie::set('article_content_images', $cookie_images);
        return json(array('uploaded'=> 1, 'url'=> 'http://' . $_SERVER['HTTP_HOST'] . $path));
    }

    /**
     * 删除已添加的图片记录（保证不会被删除）
     *
     * @param [type] $content
     * @return void
     */
    private static function remove_article_content_image($content, $type="cookie"){
        $rule = "{<img src=\"http://" . $_SERVER['HTTP_HOST'] . "}";
        $rule_two = "/\">/";
        $res = preg_split($rule, $content);
        $return_array = array();
        foreach($res as $v){
            $res_v = preg_split($rule_two, $v);
            array_push($return_array, $res_v[0]);
        }
        if($type == 'cookie'){
            $content_images = Cookie::get('article_content_images');
            if($content_images && $return_array){
                foreach($content_images as $k => $c){
                    foreach($return_array as $v){
                        if($c == $v){
                            unset($content_images[$k]);
                        }
                    }
                }
            }
            Cookie::set('article_content_images', $content_images);
        }else{
            if($return_array){
                foreach($return_array as $v){
                    delete_image($v);
                }
            }
        }
        return $return_array;
    }

    public function article_status($id){
        $status_type = Request::instance()->param('status_type', '');
        if($status_type != 'recomment' && $status_type != 'stick' && $status_type != 'hot'){
            return return_data(2, '', '非法操作');
        }
        $status_type = 'is_' . $status_type;
        $article = CmsArticle::get($id);
        if(!$article){
            return return_data(2, '', '非法操作');
        }
        $article_data = CmsArticleData::get($id);
        $article_data->$status_type = $article_data->$status_type == 0 ? 1 : 0;
        $res = $article_data->save();
        if($res){
            $status_type_text = array('is_recomment'=> '推荐', 'is_stick'=> '置顶', 'is_hot'=> '热门');
            $status_text = array('取消', '开启');
            LogAdminOperation::create_data('文章文章属性修改：'.$article->title . $status_text[$article_data->$status_type] . $status_type_text[$status_type], 'operation');
            return return_data(1, '', '设置成功');
        }else{
            return return_data(3, '', '设置失败,请联系管理员');
        }
    }
}